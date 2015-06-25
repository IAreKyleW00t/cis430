<?php
    /* Load config.php */
    require_once 'config.php';
    
    /* Start PHP Session */
    session_start();
    session_regenerate_id(true); // Security precaution
    
    /* Check if we sent a POST request */
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $start = new DateTime();
        /* Validate $_POST variables */
        if (!isset($_POST['query'])) {
            $_SESSION['error'] = "Invalid POST request.";
            header('Location: ./index.php');
            exit();
        }
        
        /* Open SQL Connection */
        $sql = new PDO(SQL_TYPE . ':host=' . SQL_HOST . ';dbname=' . SQL_DB . ';charset=utf8', SQL_USER, SQL_PASSWD);
        $sql->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $sql->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        $sql->setAttribute(PDO::ATTR_PERSISTENT, false);

        /* Query the `administrators` database */
        try {
        $sth = $sql->prepare($_POST['query']);
        $sth->execute();
        } catch (Exception $e) {
            $_SESSION['error'] = "Invalid SQL query.";
            header('Location: ./index.php');
            exit();
        }
        
        /* Check for a valid result; 1 = valid, 0 = not found */
        if ($sth->rowCount() == 0) {
            $_SESSION['error'] = "No results found.";
            header('Location: ./index.php');
            exit();
        }
        
        /* Save the user */
        $results = $sth->fetchAll();
        $meta = null;
        
        foreach(range(0, $sth->columnCount() - 1) as $i) {
            $meta[] = $sth->getColumnMeta($i);
        }
        $end = new DateTime();
    }
    
    function destroy_session() {
        /* Unset all $_SESSION variables */
        $_SESSION = array();
        
        /* Delete all session cookies */
        if (ini_get("session.use_cookies")) {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);
        }
        
        /* Destory the PHP Session */
        session_destroy();
    }
?>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8" lang="en"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9" lang="en"><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js" lang="en"><!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
        <title>CIS430 :: Assignment 6</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" type="text/css">
        
        <!-- Material CSS -->
        <link rel="stylesheet" href="css/vendor/material-fullpalette.min.css" type="text/css">
        <link rel="stylesheet" href="css/vendor/roboto.min.css" type="text/css">
        <link rel="stylesheet" href="css/vendor/ripples.min.css" type="text/css">
        
        <!-- main.css -->
        <link rel="stylesheet" href="css/main.css" type="text/css">
        <style>
            body {
                padding-top: 20px;
            }
        </style>
        
        <!-- Mondernizr -->
        <script src="js/vendor/modernizr.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row clearfix">
                <div class="col-xs-12 col-md-10 col-md-offset-1">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form class="form-horizontal" id="sql" name="sql" action="<?php echo htmlspecialchars('/~kyle' . $_SERVER['PHP_SELF']); ?>" method="post" validate>
                                <fieldset>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <textarea rows="5" class="form-control" id="query" name="query" placeholder="Enter SQL query..." autofocus required></textarea>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <div class="panel-footer text-right">
                            <button form="sql" type="reset" class="btn btn-primary">Clear</button>
                            <button form="sql" type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <?php if (isset($_SESSION['error']) || isset($results)) : ?>
            <div id="query" class="alert alert-dismissable alert-success">
                <button type="button" class="close mdi-action-done" data-dismiss="alert"></button>
                <?php echo $_POST['query']; ?>
            </div>
            <div class="row clearfix">
                <div class="col-xs-12">
                    <div class="panel panel-default">
                        <div id="results" class="panel-body">
                            <?php if (isset($_SESSION['error'])) : ?>
                                <div class="text-center">
                                    <h4><?php echo $_SESSION['error']; destroy_session(); ?></h4>
                                </div>
                            <?php else : ?>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <?php 
                                                foreach ($meta as $col) {
                                                    if (!empty($col['flags'])) {
                                                        if (in_array('primary_key', $col['flags'])) {
                                                            echo '<th><u>' . $col['name'] . '</u></th>' . "\n";
                                                        } else {
                                                            echo '<th>' . $col['name'] . '</th>' . "\n";
                                                        }
                                                    } else {
                                                        echo '<th>' . $col['name'] . '</th>' . "\n";
                                                    }
                                                }
                                            ?>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                            foreach ($results as $row) {
                                                echo "<tr>\n";
                                                    for ($i = 0; $i < sizeof($meta); $i++) {
                                                        echo '<td>' . (is_null($row[$i]) ? '<em>NULL</em>' : $row[$i]) . '</td>' . "\n";
                                                    }
                                                echo "</tr>\n";
                                            }
                                        ?>
                                    </tbody>
                                </table>
                            <?php endif; ?>
                        </div>
                        <div class="panel-footer text-right">
                            <b>Total Results</b>: <?php echo sizeof($results); ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php endif; ?>
        </div>
    
        <!-- jQuery -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
        
        <!-- Bootstrap JS -->
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
        
        <!-- Material JS -->
        <script src="js/vendor/material.min.js" type="text/javascript"></script>
        <script src="js/vendor/ripples.min.js" type="text/javascript"></script>

        <!-- main.js -->
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>