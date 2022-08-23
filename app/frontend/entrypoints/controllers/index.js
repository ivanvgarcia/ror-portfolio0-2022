import { Application } from "@hotwired/stimulus";
import { registerControllers } from "stimulus-vite-helpers";

const app = Application.start();

const controllers = import.meta.globEager("./**/*_controller.js");
registerControllers(app, controllers);
