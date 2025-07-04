package main

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"
)

func ConvertCelsiusToFarenheit(c echo.Context) error {
	query := c.Param("celsius")

	celsius, err := strconv.ParseFloat(query, 64)
	if err != nil {
		return err
	}

	farenheit := (celsius * 9 / 5) + 32

	return c.String(http.StatusOK, fmt.Sprintf("%f", farenheit))
}

func main() {
	e := echo.New()

	api := e.Group("/api")
	api.GET("/temperature/:celsius", ConvertCelsiusToFarenheit)
	e.Logger.Fatal(e.Start(":8080"))
}
