| layer                 | image                      | role                                              |
|-----------------------|----------------------------|---------------------------------------------------|
| 0: install-checkers   | `zjpzjp/os-checker:local` | Environment where all checkers are installed.     |
| 1: install-os-checker | local `os-checker`         | Environment where os-checker tools are installed. |

Once local `os-checker` image is built, execute `run.sh` in the container.
