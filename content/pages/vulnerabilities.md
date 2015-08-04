Title: Vulnerabilities
Date: 2015-08-03

SSOScan currently looks for these five types of vulnerabilities.

### 1. Access token misuse

When a website uses an <em>access_token</em> from Facebook to authenticate
users, impersonation attacks can happen.  This implementation is
dangerous because the <em>access_token</em> is not tied to a user's
identity or your application ID, but only to user's permissions.  This
means a malicious application which holds a victim's
<em>access_token</em> (because the victim has been tricked into
using the malicious application) could simply reuse that token to login
to the vulnerable website as that victim.  

**Mitigation.** To mitigate this vulnerability, we suggest websites to
use either code or signed_request provided by Facebook when
authenticating users.  If an <em>access_token</em> has to be used, be
sure to verify its intended audience explained on this page: <a
href="https://developers.facebook.com/docs/facebook-login/access-tokens/#debug">Facebook
developer guide</a>.  

### 2. Signed_request misuse

When a website uses <em>signed_request</em> from Facebook to
authenticate users, impersonation attacks can still happen if the
developer doesn't check its signature and signed content with care.  An
attacker can simply forge a <em>signed_request</em> with an
incorrect signature, or modify the content of a
<em>signed_request</em> intended for another application.  When the
attacker supplies the fake credential to a vulnerable website, it will
still authenticate the attacker as the victim.  If
<em>access_token</em> is used along with
<em>signed_request</em>, it is also important to check that the
identities of both credentials agree with each other.

**Mitigation.** To mitigate this vulnerability, we suggest websites to
  parse the signed_request and check its signature using application
  secret correctly.  Visit <a
  href="https://developers.facebook.com/docs/facebook-login/using-login-with-games/">
_https://developers.facebook.com/docs/facebook-login/using-login-with-games/_</a>
  for more details.

### 3. Credential leakage via referrer header

Referrer header is auto-appended to requests initiated from any webpage
to other parties.  If a website includes OAuth credentials (such as
<em>access_token</em>, etc.) in their URLs, they should make sure
the page content does not include any untrusted resources.  For example,
if a website includes a picture from an untrusted source 'evil.com',
that maliciouis site will be able to get all OAuth credentials of users
logging in to your site.

**Mitigation.** To mitigate this vulnerability, we suggest a website
consume user's OAuth credentials at server side and do not return such
information back to the client side.  Such credentials can be stored in
web server's back end DB and can be linked to the user by setting a
cookie in user's browser.  

### 4. Client secret leakage

Including <em>client_secret</em> on client side is dangerous, it enables
any user to impersonate the application.  It can be used to forge
<em>signed_request</em> to log in as anybody to your application

**Mitigation.** To mitigate this vulnerability, we suggest the web
  application never include <em>client_secret</em> on the client side.

### 5. Credential leakage via page content

Including Facebook's SSO OAuth credentials (e.g. <em>access_token</em>)
in the landing page content (e.g. registration page) after the user has
logged in can be dangerous because there might be other third-party
scripts embedded on the webpage, and they have full access to the host
information.  Once the OAuth credentials are exfiltrated, potential
risks include leaking sensitive victim information and powerful
permissions such as posting to victim's timeline as the vulnerable
application, and even impersonation attacks (reuse the OAuth credentials
to login as the victim to the vulnerable website).  

**Mitigation.** To mitigate this vulnerability, we suggest the web
application never include OAuth credentials in the page content.  If for
some reason client-side JavaScript needs access to them, we suggest this
information be fetched from your app server using AJAX requests and
stored as private variables (in a closure).  

