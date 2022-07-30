# If you need Python 3 and the GitHub CLI, then use:
FROM cicirello/pyaction:4

LABEL repository="https://github.com/EnricoMi/publish-unit-test-result-action"
LABEL homepage="https://github.com/EnricoMi/publish-unit-test-result-action"
LABEL maintainer="Enrico Minack <github@Enrico.Minack.dev>"

LABEL com.github.actions.name="Publish Test Results"
LABEL com.github.actions.description="A GitHub Action to publish test results."
LABEL com.github.actions.icon="check-circle"
LABEL com.github.actions.color="green"

RUN apk add --no-cache --upgrade expat libuuid

COPY requirements.txt /action/
RUN apk add --no-cache build-base libffi-dev; \
    pip install --upgrade --force --no-cache-dir pip && \
    pip install --upgrade --force --no-cache-dir -r /action/requirements.txt; \
    apk del build-base libffi-dev


COPY entrypoint.py /entrypoint.py
ENTRYPOINT ["/entrypoint.py"]
