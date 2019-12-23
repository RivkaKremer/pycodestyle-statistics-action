#!/bin/sh
set -e

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "The GITHUB_TOKEN is required."
	exit 1
fi

cd $GITHUB_WORKSPACE

set +e
OUTPUT=$(pycodestyle --statistics -qq .)
SUCCESS=$?
echo $OUTPUT
set -e

if [[ -z "$PRECOMMAND_MESSAGE" ]]; then
    echo "No precommand message"
else
    echo "There is a precommand message"
    OUTPUT=$PRECOMMAND_MESSAGE$'\n\n'$OUTPUT
fi

# If there were errors as part of linting, post a comment. Else, do nothing.
if [ $SUCCESS -ne 0 ]; then
    if [ ! -z "$PRECOMMAND_MESSAGE" ]; then
        OUTPUT=$PRECOMMAND_MESSAGE'\n'$OUTPUT
    fi
else
    echo "There were no pycodestyle issues"
fi

echo $OUTPUT

exit $SUCCESS