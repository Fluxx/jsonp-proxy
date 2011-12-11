# jsonp-proxy

This proxy was originally created by Mike Mayo (see root of fork), but I wanted to fork it to simplify some things and potentially do some more work to it.

## Example:

```
http://localhost:4567/?jsonp=callback&u=http%3A//bitfluxx.com
```

You then get back some javascript code with a function call of your `jsonp` query parameter.  That function is passed a JSON object with the following structure:

``` javascript
{
  status: response.status,
  headers: response,headers,
  body: response.body
}
```