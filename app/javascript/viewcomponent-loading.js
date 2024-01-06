export function loadViewComponentControllers(application) {
  const paths = Object.keys(parseImportmapJSON()).filter(path => path.match(/(.+\/controller)$/))

  paths.forEach((path) => registerControllerFromPath(path, application))
}

const parseImportmapJSON = () => {
  return JSON.parse(document.querySelector("script[type=importmap]").text).imports
}

const registerControllerFromPath = (path, application) => {
  const componentController = path.match(/(.+\/controller)$/);
  const name =
    componentController &&
    componentController[1]
      .replace(/controller/g, "component")
      .replace(/\//g, "--")
      .replace(/_/g, "-");

  import(path)
    .then((module) => registerController(name, module, application))
    .catch((error) => console.error(`Failed to register controller: ${name} (${path})`, error))
};

const registerController = (name, module, application) => {
  console.log(`registered ${name}`)
  application.register(name, module.Controller)
}
