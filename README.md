# LicenseFinder running inside Docker
Runs [LicenseFinder](https://github.com/pivotal/LicenseFinder) inside a docker container.

Supports some native libraries for package compilation. If needed just add more (one day we may want to have that be a runtime thing).

## Supported Languages/Package Managers
* Ruby/Bundler
* NodeJS/NPM
* Elixir/Hex

## Usage
Run the docker image and mount your code to /data.

`docker run --rm --volume $(pwd):/data tinfoil/licensefinder <Optional directory to cd to before running 'license_finder'>`
