{:user {:dependencies [[aprint "0.1.3"]
                       ;; [spyscope "0.1.5"]
                       [org.clojure/java.classpath "0.2.2"]
                       [org.clojure/tools.namespace "0.2.11"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       ;; [alembic "0.3.2"]
                       [im.chit/vinyasa "0.4.2"]
                       [codox "0.8.13"]
                       [debugger "0.1.7"]]
        :injections [;; (require 'spyscope.core)
                     (require '[clojure.java.classpath :as cp])
                     (require '[vinyasa.inject :as inject])

                     (inject/in

                      clojure.core >
                      [clojure.tools.namespace.repl refresh]
                      [clojure.java.shell sh]
                      [aprint.core aprint]
                      [clojure.test run-tests])]
        :plugins  [[venantius/ultra  "0.4.0"]
                   [lein-pprint "1.1.2"]
                   [lein-ancient "0.6.7"]
                   [lein-bikeshed "0.2.0"]
                   [refactor-nrepl "2.0.0-SNAPSHOT"]
                   [cider/cider-nrepl "0.11.0-SNAPSHOT"]]
        :ultra  {:color-scheme :solarized_dark}}}
