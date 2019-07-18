package main

import (
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/TestFunction", testFunction)
	router.HandleFunc("/InsertNewLoan", insertLoan).Methods("POST")
	router.HandleFunc("/AverageLoan", getAverageLoan).Methods("GET")
	router.HandleFunc("/Installment", getInstallment).Methods("GET")
	http.Handle("/", router)
	fmt.Println("Connected to port 31222")

	if err := http.ListenAndServe(":31222", router); err != nil {
		log.Println(err)
	}
}
