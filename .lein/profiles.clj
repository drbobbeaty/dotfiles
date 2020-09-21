{
 :user {:plugins [[lein-exec "0.3.7"]
                  ;; [venantius/ultra "0.6.0"]
                  [mvxcvi/whidbey "2.2.1"]]
        :middleware [whidbey.plugin/repl-pprint]
        :whidbey {:color-scheme {:delimiter [:bold :yellow]
                                 :tag [:bold :yellow]
                                 :nil [:cyan]
                                 :boolean [:bold :cyan]
                                 :number [:bold :green]
                                 :string [:bold :red]
                                 :character [:cyan]
                                 :keyword [:yellow]
                                 :symbol [:bold :magenta]
                                 :function-symbol [:bold :blue]
                                 :class-delimiter [:blue]
                                 :class-name [:green]
                                 :exception [:bold :red]}}
        :ultra {:color-scheme ;; :solarized_dark
                 {:delimiter [:bold :yellow]
                  :tag [:bold :yellow]
                  :nil [:cyan]
                  :boolean [:bold :cyan]
                  :number [:bold :green]
                  :string [:bold :red]
                  :character [:cyan]
                  :keyword [:yellow]
                  :symbol [:bold :magenta]
                  :function-symbol [:bold :blue]
                  :class-delimiter [:blue]
                  :class-name [:green]
                  :exception [:bold :red]}}
      }
}

