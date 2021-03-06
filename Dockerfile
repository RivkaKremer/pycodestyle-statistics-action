FROM python:3.7-alpine

LABEL name="pycodestyle-action"
LABEL version="1.0.0"
LABEL repository="http://github.com/ankitvgupta/pycodestyle-action"
LABEL homepage="http://github.com/ankitvgupta/pycodestyle-action"

LABEL maintainer="Ankit Gupta <ankit45@gmail.com>"
LABEL com.github.actions.name="pycodestyle-action"
LABEL com.github.actions.description="Run Pycodestyle on pull request"
LABEL com.github.actions.icon="git-pull-request"
LABEL com.github.actions.color="purple"

RUN apk add --no-cache git
RUN apk add bash
RUN pip install --upgrade pycodestyle


COPY "entrypoint.sh" "/entrypoint.sh" 
ENTRYPOINT ["/entrypoint.sh"]
ddd
