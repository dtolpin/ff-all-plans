(define (domain remote-shell)
    (:requirements :adl)

    (:types fd)

    (:constants fd0 - fd
                fd1 - fd)
    
    (:predicates
        (opened ?fd - fd)
        (remote-shell-started)
    ) 

    (:action close
        :parameters     (?fd - fd)
        :effect         (not (opened ?fd))

    )

    (:action execve 
       :parameters      ()
       :effect          (when   (exists (?fd - fd) (not (opened ?fd)))
                                (remote-shell-started))
    )
)