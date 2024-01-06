// We reserve Controller for the export name
import { Controller as BaseController } from "@hotwired/stimulus";

export class Controller extends BaseController {
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }
}
