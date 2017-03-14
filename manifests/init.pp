class logrotate_wrapper (
  $rotate        = '7',
  $rotate_every  = 'day',
  $missingok     = true,
  $copytruncate  = true,
  $dateext       = true,
  $delaycompress = false,
  $mail          = false,
  $ifempty       = false,
  $compress      = true,
  
){

  Logrotate::Rule {
    rotate        => $rotate,
    rotate_every  => $rotate_every,
    missingok     => $missingok,
    copytruncate  => $copytruncate,
    dateext       => $dateext,
    delaycompress => $delaycompress,
    mail          => $mail,
    ifempty       => $ifempty,
    compress      => $compress,
  }

  logrotate::rule { 'faillog':
    path          => '/var/log/faillog',
    postrotate    => 'reload rsyslog > /dev/null 2>&1 || true',
  }
  logrotate::rule { 'bootlog':
    path          => '/var/log/boot.log',
    postrotate    => 'reload rsyslog > /dev/null 2>&1 || true',
  }
  logrotate::rule { 'cron':
    path          => '/var/log/cron',
    postrotate    => 'reload rsyslog > /dev/null 2>&1 || true',
  }
  logrotate::rule { 'messages':
    path          => '/var/log/messages',
    postrotate    => 'reload rsyslog > /dev/null 2>&1 || true',
  }
  logrotate::rule { 'maillog':
    path          => '/var/log/maillog',
    postrotate    => 'reload rsyslog > /dev/null 2>&1 || true',
  }
  logrotate::rule { 'secure':
    path          => '/var/log/secure',
    postrotate    => 'reload rsyslog > /dev/null 2>&1 || true',
  }
  logrotate::rule { 'syslog':
    path          => '/var/log/spooler',
    postrotate    => 'reload rsyslog > /dev/null 2>&1 || true',
  }

}
