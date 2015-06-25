Project 6
---------
#### Description
  Create a PHP web page that will allow users to query the server and display the results on the page. This page is designed to allow any query to be accepted as long as it is a valid query. Errors will result in a not-so-detailed error message. It is designed to only handle `SELECT` statements.

#### config.php
  The secure configuration file we use is not provided to the public, but an example is provided below. Most of these values are never used, but kept just in case.

  ```
  /* Global Salts/Keys; Created with: https://api.wordpress.org/secret-key/1.1/salt/ */
  define('AUTH_KEY',         '(+bTAv-yHhjyp[19|#Bb3KtW<yvm:dB;q0-&=~^@<q Do=rE3*;LJ:Zm8?4<]# 7');
  define('SECURE_AUTH_KEY',  'oSv?;*w9O2,{7W+Q]0{4BVP=}!8ssRH4eIOkbvI.F*IulE&QNAsI`-7p:2zNG~yL');
  define('LOGGED_IN_KEY',    '6Bf.(fR`o/;&>*Otw^136?PDq |uJOoJC&QFX7C;[~;Z<;Oak^[iZ^z$VQ< Y~Q9');
  define('NONCE_KEY',        'k|I^}cC^x1VrgXQz[7cKiwGp#[6#3Op+m|crFPP oKs&L3h-Fs|T|,rK~,]}gZ<s');
  define('AUTH_SALT',        'v|<[(Sz-#nn+ B(4K#*P|&Hqj!-[2IRGU$JD})RY/n~.XfX^6ST+lD:M;G TKam)');
  define('SECURE_AUTH_SALT', 'nIP`d*`X07vf<?k6(3&V9.!Ekich5[!t4=v?Xt|1/D1B$sI-s1.>Hd )./}ZSSl:');
  define('LOGGED_IN_SALT',   'ta%Qy*K7f*][LU`]59):A>[@doV#o7<mE|c-TKgpFoT_;`X7:Noo!Dj3s#3|ceoX');
  define('NONCE_SALT',       'f@eo0t&ys-+# Oc+Y-{+:Qf#|f.Bww`LO+JNy-m6+K>i|m2q3kZ%n|u{m#V|zZH6');

  /* MySQL Database Settings */
  define('SQL_TYPE',          'mysql');
  define('SQL_HOST',          'localhost');
  define('SQL_PORT',          '3306');
  define('SQL_DB',            'my_database');
  define('SQL_USER',          'my_password');
  define('SQL_PASSWD',        'passw0rd!');

  /* Hashing Algorithm; See: http://php.net/manual/en/function.hash.php */
  define('HASH',              'sha256');
  ```
  
#### Example Query
  ![Example Query](http://i.imgur.com/ld7I0Su.png)
