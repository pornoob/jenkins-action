# Jenkins Action
Calls to Jenkins Job/Pipeline using the CRUMB token. The parameters are optional in a querystring format (var1=val1&var2=val2)

## Inputs
### `user`
**required** Jenkins User. default `"jenkins"`
### `token`
**required** Jenkins User Password/Token. Default `"jenkins"`
### `url`
**required** Jenkins Base URL. Default `"jenkins_host"`
### `job`
**required** Jenkins Job/Pipeline Name. Default `"jenkins_host"`
### `parameters`
**optional** Jenkins Job/Pipeline parameters. Default `"<an empty string>"`

