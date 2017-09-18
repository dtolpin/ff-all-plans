(define (problem detect-remote-shell)
    (:domain remote-shell)
    (:objects

    )
    (:init
            (opened fd0)
            (opened fd1)
    )

    (:goal  (remote-shell-started))
)
