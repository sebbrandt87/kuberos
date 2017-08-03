<template>
  <div id="kuberos">
    <div v-if="error" class="alert alert-danger">
      <p>Could not connect to authentication API: {{error.response.status}} {{error.response.statusText}}</p>
    </div>
    <div v-else>
      <div class="container">
        <div class="row"><br/></div>
        <div class="row">
          <div class="col-md-1"></div>
          <div class="col-md-1"></div>
            <h3>Authenticate yourself</h3>
            <p>
              Execute the following commands to be able to authenticate yourself against kubernetes cluster with <code>kubectl</code>:
            </p>
            <pre>
            $ kubectl config set-credentials "{{kubecfg.email}}" \
              --auth-provider=oidc \
              --auth-provider-arg=client-id="{{kubecfg.clientID}}" \
              --auth-provider-arg=client-secret="{{kubecfg.clientSecret}}" \
              --auth-provider-arg=id-token="{{kubecfg.idToken}}" \
              --auth-provider-arg=refresh-token="{{kubecfg.refreshToken}}" \
              --auth-provider-arg=idp-issuer-url="{{kubecfg.issuer}}"
            </pre>
            Then this one to associate your user with an existing cluster:
            <pre>
            $ kubectl config set-context mycontext \
              --cluster mycluster \
              --user="{{kubecfg.email}}"
            </pre>
          <div class="col-md-1"></div>
        </div>
      </div>
    </div>
  </div>
</template>
