package main

import (
	"database/sql"
	"log"
)

func connectmysql() *sql.DB {
	db, err := sql.Open("mysql", "root:greycore@tcp(localhost:3306)/db_test_tunaiku")
	if err != nil {
		log.Fatal(err)
	}
	return db
}
