
# Project Name: jobMate

## Description

Application built on Ruby on Rails to assist in managing job search contacts and tasks. Project is aimed at creating integrations to help manage the process of a job search.

## Ruby version
Version: 2.3.1<br>
Rails: '~> 5.0.0', '>= 5.0.0.1'

## System dependencies

This application requires:
  * Bundler
  * PostGresSQL

## Deployment instructions
  1. Clone Repo locally
  2. Navigate to local repo directly in your terminal
  3. Run 'bundle install'
  4. Create Databases
    * Run 'rails db:create'
    * Run 'rails db:migrate'
    * Run 'rails db:seed'
    * Run 'rails db:test:prepare'
  5. Create .env file (see below)
  6. Run 'rails server' to start local server
  7. Open 'localhost:3000' in your browser

## Application instructions
  1. Your first step to adding anything into the database is to sign up a new profile.
  2. From the company profile page you may then enter in either jobs you are interested in or contacts.
  3. Companies, contacts, and jobs may then be edited or deleted.

## APIs and the .env
  This application makes use of three external APIs. All offer a free level of access, which should provide adequate use for testing or individual deployment of this app.
  * <a href="https://www.fullcontact.com/developer/">Full-Contact Company API</a>
  * <a href="https://www.ibm.com/watson/developercloud/tone-analyzer.html">IBM Watson Tone Analyzer </a> - If you have not previously registered with IBM's developer cloud service, BlueMix, checkout their <a href="https://www.ibm.com/watson/developercloud/doc/getting_started/">Getting Started</a> guide.
  * <a href="https://www.ibm.com/watson/developercloud/alchemy-data-news.html">Alechemey Data News API</a> - Also part of the IBM Watson ecosystem, though you will need to register for seperate api key.
Once registered, note your Full-Contact api_key and your IBM user number and key. Create a .env file in the project root directory as follows:

    FULL_CONTACT_API_KEY="<YOUR_API_KEY>"
    WATSON_USER_NUM="<YOUR_IBM_USER_NUMBER>"
    WATSON_PWORD="<YOUR_IBM_USER_KEY>"
    ALCHEMY_DATA_KEY="<YOUR_API_KEY>"

Enter your actual credentials. Restart the server if it was running.

## Contact
  Contact me @ <a href="mailto:bhgrant@gmail.com">bhgrant8@gmail.com</a><br>
  * As this is currently a school project no change/pull requests will be accepted until final review in class.
  * However any content suggestions are appreciated.

## License
  This program is Free Software under the GNU General Public License (GPL) version 3
  Visit: https://www.gnu.org/licenses/gpl.html
