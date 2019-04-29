package main

import (
	"flag"

	"plugin"
)

var path string

func init() {
	flag.StringVar(&path, "p", "", "Path to plugin.")
}

func main() {
	flag.Parse()

	if path == "" {
		panic("Plugin path not specified.")
	}

	p, err := plugin.Open(path)
	if err != nil {
		panic(err)
	}

	f, err := p.Lookup("Message")
	if err != nil {
		panic(err)
	}

	f.(func())()
}
