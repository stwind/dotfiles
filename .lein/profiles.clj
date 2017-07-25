{:user {:dependencies [[spyscope "0.1.6"]
                       [org.clojure/java.classpath "0.2.3"]
                       [org.clojure/tools.namespace "0.2.11"]
                       [org.clojure/tools.nrepl "0.2.13"]
                       [im.chit/hara "2.5.2"]
                       [im.chit/vinyasa "0.4.7"]
                       [acyclic/squiggly-clojure "0.1.8"]]
        :injections [;; (require 'spyscope.core)
                     (require '[clojure.java.classpath :as cp])
                     (require '[vinyasa.inject :as inject])

                     (inject/in
                      [vinyasa.inject :refer [inject [in inject-in]]]
                      [clojure.tools.namespace.repl refresh]
                      [clojure.test run-tests]

                      clojure.core
                      [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]

                      clojure.core >
                      [clojure.java.shell sh])]
        :plugins  [[venantius/ultra  "0.5.1"]
                   [lein-ancient "0.6.10"]
                   [lein-hiera "0.9.5"]
                   [lein-bikeshed "0.4.1"]
                   [refactor-nrepl "2.3.0"]
                   [lein-ns-dep-graph "0.1.0-SNAPSHOT"]
                   [cider/cider-nrepl "0.15.0-SNAPSHOT"]]
        :ultra  {:color-scheme :solarized_dark}
        :env {:bearychat-nimbus-host "127.0.0.1"
              :bearychat-nimbus-port "9999"
              :bearychat-db-subname "//127.0.0.1:3306/snitch"
              :bearychat-db-usename "snitch"
              :bearychat-db-pwd "snitch"
              :bearychat-redis-host "127.0.0.1"
              :bearychat-redis-cache-host "127.0.0.1"
              :bearychat-rabbitmq-host "127.0.0.1"
              :bearychat-eventlog-port 9998}}
 :test {:env {:bearychat-nimbus-host "127.0.0.1"
              :bearychat-nimbus-port "9999"
              :bearychat-db-subname "//127.0.0.1:3306/snitch"
              :bearychat-db-usename "snitch"
              :bearychat-db-pwd "snitch"
              :bearychat-redis-host "127.0.0.1"
              :bearychat-redis-cache-host "127.0.0.1"
              :bearychat-rabbitmq-host "127.0.0.1"
              :bearychat-eventlog-port 9998}}}
