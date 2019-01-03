#!/bin/bash
set -e
set -o pipefail

YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo
echo -e "${YELLOW}Checking${NC}"
echo -e "${YELLOW}------------${NC}"
echo

echo -e "${BLUE}Checking Rubocop${NC}"
bundle exec rubocop --rails --fail-fast
echo

echo -e "${BLUE}Checking Brakeman${NC}"
bundle exec brakeman -z -q --no-pager
echo

echo -e "${BLUE}Checking Rspec${NC}"
rspec --failure-exit-code 1
echo

# echo -e "${BLUE}Checking JS files with Yarn${NC}"
# yarn eslint --ext .jsx,.js 'app/assets/javascripts/**/*' 'app/javascript/common/**/*'
# echo

# echo -e "${BLUE}Checking Translations${NC}"
# i18n-tasks missing
# echo

echo
echo -e "${GREEN}Check finished succesfully${NC}"
echo
