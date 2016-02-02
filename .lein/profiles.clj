{:user {:dependencies [;; [spyscope "0.1.5"]
                       [org.clojure/java.classpath "0.2.2"]
                       [org.clojure/tools.namespace "0.2.11"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       [im.chit/vinyasa "0.4.2"]
                       #_[acyclic/squiggly-clojure "0.1.4"]]
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
        :plugins  [[venantius/ultra  "0.4.0"]
                   [lein-ancient "0.6.8"]
                   [lein-bikeshed "0.2.0"]
                   [refactor-nrepl "2.0.0-SNAPSHOT"]
                   [cider/cider-nrepl "0.11.0-SNAPSHOT"]]
        :ultra  {:color-scheme :solarized_dark}}}
