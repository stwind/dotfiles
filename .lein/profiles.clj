{:user  {:dependencies [[pjstadig/humane-test-output "0.7.0"]
                        [aprint "0.1.3"]
                        ;; [spyscope "0.1.5"]
                        ; [org.clojure/tools.namespace "0.2.11"]
                        [org.clojure/java.classpath "0.2.2"]
                        ;; [alembic "0.3.2"]
                        [im.chit/vinyasa "0.4.2"]
                        [codox "0.8.13"]
                        [debugger "0.1.7"]]
         :injections [(require 'pjstadig.humane-test-output)
                      ;; (require 'spyscope.core)
                      (require '[clojure.java.classpath :as cp])
                      (pjstadig.humane-test-output/activate!)
                      ;; (use 'aprint.core)
                      (require '[vinyasa.inject :as inject])

                      (inject/in

                       clojure.core >
                       [clojure.java.shell sh]
                       [aprint.core aprint])]
         :plugins  [[venantius/ultra  "0.3.4"]
                    [lein-pprint "1.1.2"]
                    [lein-ancient "0.6.7"]
                    [lein-bikeshed "0.2.0"]
                    [refactor-nrepl "2.0.0-SNAPSHOT"]
                    [cider/cider-nrepl "0.10.0-SNAPSHOT"]]
         :ultra  {:color-scheme :solarized_dark}}}
