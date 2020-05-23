worker_processes 8
timeout 30

pid '/var/www/projects/bookcafe-review-app/tmp/pids/unicorn.pid'
listen '/var/www/projects/bookcafe-review-app/tmp/unicorn.sock'

stdout_path "/var/www/projects/bookcafe-review-app/log/unicorn.stdout.log"
stderr_path "/var/www/projects/bookcafe-review-app/log/unicorn.stderr.log"