package main

import (
	"fmt"
	"log"
	"net/http"
)

var s = &http.Server{Addr: ":9000"}

func main() {
	http.HandleFunc("/", handler)
	log.Fatal(s.ListenAndServe())
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello")
}
