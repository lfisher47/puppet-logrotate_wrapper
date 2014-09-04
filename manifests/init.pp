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
  logrotate::rule { 'lastlog':
    path          => '/var/log/lastlog',
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

}
