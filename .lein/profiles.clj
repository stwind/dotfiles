{:user {:dependencies [[spyscope "0.1.6"]
                       [org.clojure/java.classpath "0.2.3"]
                       [org.clojure/tools.namespace "0.2.11"]
                       [org.clojure/tools.nrepl "0.2.13"]
                       [im.chit/hara "2.5.10"]
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
                   [lein-ancient "0.6.12"]
                   [lein-hiera "0.9.5"]
                   [lein-bikeshed "0.5.0"]
                   [refactor-nrepl "2.3.1"]
                   [lein-ns-dep-graph "0.1.0-SNAPSHOT"]
                   [cider/cider-nrepl "0.16.0-SNAPSHOT"]]
        :ultra  {:color-scheme :solarized_dark}
        :env {:snitch-nimbus-host "127.0.0.1"
              :snitch-nimbus-port "9999"
              :snitch-db-subname "//127.0.0.1:3306/snitch"
              :snitch-db-usename "snitch"
              :snitch-db-pwd "snitch"
              :snitch-redis-host "127.0.0.1"
              :snitch-redis-cache-host "127.0.0.1"
              :snitch-rabbitmq-host "127.0.0.1"
              :snitch-eventlog-port 9998}}
 :test {:env {:snitch-nimbus-host "127.0.0.1"
              :snitch-nimbus-port "9999"
              :snitch-db-subname "//127.0.0.1:3306/snitch"
              :snitch-db-usename "snitch"
              :snitch-db-pwd "snitch"
              :snitch-redis-host "127.0.0.1"
              :snitch-redis-cache-host "127.0.0.1"
              :snitch-rabbitmq-host "127.0.0.1"
              :snitch-eventlog-port 9998}}}
