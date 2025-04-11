#   L'output deve essere regolato da showStatistics:
#       -ALL -> mostra sia plots che tabelle descrittive
#       -PLOTS -> mostra solo i plots
#       -TABLES -> mostra solo le tabelle descrittive
#   Il salvataggio di tabelle e plots deve essere regolato da delle variabili, possibilità di salvare tutte le immagini
#   generate durante l'esecuzione, solo le tabelle o solo i plots, tutto sotto forma di .pdf.
#   E' possibile specificare un path dove salvare i pdf generati, che avranno un nome univoco dato del tipo
#   data_timestamp_nomedataset.pdf.
#   Sarà possibile specificare un nome del file.
#   Possibile specificare, nel caso si volessero vedere altre statistiche descrittive, quali statistiche mostrare per le variabili categoriche e continue.
#   Tutti i parametri sono opzionali, in caso di chiamata senza parametri verranno assunti dei valori di default specificati sotto.
#
#
#   @param
#       whichStatisticToShow -> CHAR, 3 possibili valori "ALL", "PLOTS", "TABLES", regola l'output della funzione
#                               default "ALL"
#       SAVE_OUTPUT_FILE -> LOGICAL, se TRUE crea un file pdf con immagini dell'output della funzione,
#               default = FALSE
#       saveTo -> CHAR, percorso assoluto o relativo della cartella dove salvare il file pdf generato, può comprendere il nome del file .pdf
#                 default è la working directory di R
#       render_categorical -> list(CHAR), lista di parole chiave contenenti le statistiche da mostrare per variabili categoriche
#                             default = NULL
#       render_continuous -> list(CHAR), lista di parole chaive contenenti le statistiche da mostrare per variabili continue
#                             default = NULL
#
descriptiveStatisticsMunich2019dataset(whichStatisticToShow,
                                       SAVE_OUTPUT_FILE,
                                       saveFile,
                                       render_categorical,
                                       render_continuous)

