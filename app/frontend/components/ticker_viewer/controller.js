// We reserve Controller for the export name
import { Controller as BaseController } from "@hotwired/stimulus";

export class Controller extends BaseController {
  static targets = ["change"]; // https://stimulus.hotwired.dev/reference/targets

  connect() {
    this.element.classList.add("new-item");
  }

  toggle(event) {
    if (event.currentTarget.dataset.priceType == "price") {
      this.changeTarget.innerHTML = event.currentTarget.dataset.percentChange + "%";
      event.currentTarget.dataset.priceType = "percent";
    } else {
      this.changeTarget.innerHTML = event.currentTarget.dataset.priceChange;
      event.currentTarget.dataset.priceType = "price";
    }
  }
}
