import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menuOverlay"];

  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  openMenu() {
    this.menuOverlayTarget.classList.add("opacity-100", "visible", "ease-in");
    this.menuOverlayTarget.classList.remove(
      "opacity-0",
      "invisible",
      "ease-out"
    );
  }

  closeMenu() {
    this.menuOverlayTarget.classList.add("opacity-0", "invisible", "ease-out");
    this.menuOverlayTarget.classList.remove(
      "opacity-100",
      "visible",
      "ease-in"
    );
  }
}
