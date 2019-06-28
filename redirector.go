package handler

import (
	"fmt"
	"net/http"
)

func Handler(w http.ResponseWriter, r *http.Request) {
	if r.Host != "www.festivaljapon.com" {
		w.WriteHeader(http.StatusForbidden)
		return
	}
	http.Redirect(w, r, fmt.Sprintf("https://festivaljapon.com%s", r.URL), 301)
  }
