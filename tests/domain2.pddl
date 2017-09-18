(define (domain remote-shell)
    (:requirements :adl)

    (:types
        fd
        path
    )

    (:constants fd0 - fd
                fd1 - fd
    )
    
    (:predicates
        (opened ?fd - fd)
        (is-socket ?fd - fd)
        (connected ?fd - fd)
        (remote-shell-started ?path)
        (is-shell ?path - path)
    ) 

    (:action socket
        :parameters     (?returned-fd - fd)
        :effect         (when   (not    (opened ?returned-fd))
                                        (and    (opened ?returned-fd)
                                                (is-socket ?returned-fd)))
    )

    (:action close
        :parameters     (?fd - fd)
        :effect         (and    (not (opened ?fd))
                                (not (is-socket ?fd)))
    )

    ; (:action connect
    ;     :parameters     (?fd - fd)
    ;     :effect         (and    (when   (and    (opened ?fd)
    ;                                             (is-socket ?fd)
    ;                                             (not (connected ?fd)))
    ;                                     (connected ?fd))
    ;                     )  
    ; )

    (:action execve 
       :parameters      (?path - path)
       :effect          (when (and  (is-shell ?path)
                                    (exists (?fd - fd) 
                                        (and    (is-socket ?fd)
                                        )
                                    )
                               )
                               (remote-shell-started ?path)
                        )
    )
)