(define (problem detect-remote-shell)
    (:domain remote-shell)
    (:objects
			sh - path
    )
    (:init
            (opened fd0)
            (opened fd1)
            (is-shell sh)
    )

    (:goal  (exists (?path - path) (remote-shell-started ?path)))
)
