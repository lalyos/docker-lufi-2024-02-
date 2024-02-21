#!/bin/bash

cat > /var/www/html/index.html <<EOF
<html lang="en">
<head>
</head>
<body bgcolor="${COLOR:-gray}">
   <h1>${TITLE:-Welocme}<h1>
   ${BODY:- Pleas use TITLE/COLOR/BODY env vars}
</body>
</html>
EOF


nginx -g "daemon off;"