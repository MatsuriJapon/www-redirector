#!/bin/sh
ENDPOINTS="/activities /api/department/list /api/volunteer/download /api/volunteer/download/:id /api/volunteer/:id/unregister /api/volunteer/:id/update /api/volunteer/list /api/volunteer/unregister /auth/confirm /auth/saml/callback /auth/:service /contact /contact/:department /fr /fr/acces /fr/activites /fr/activities /fr/benevoles /fr/contact /fr/contact/:department /fr/location /fr/location/map /fr/media /fr/medias /fr/privacy-policy /fr/registration /fr/terms-of-service /fr/volunteers /ja /ja/activities /ja/basho /ja/contact /ja/contact/:department /ja/location /ja/location/map /ja/media /ja/privacy-policy /ja/registration /ja/rennraku /ja/rennraku/:department /ja/terms-of-service /ja/touroku /ja/volunteers /location /location/map /media /privacy-policy /registration /signout /terms-of-service /volunteerlist /volunteers"
BASE="localhost:3000"
for ENDPOINT in ${ENDPOINTS}; do
    curl -sI --header 'Host: www.festivaljapon.com' ${BASE}${ENDPOINT} | grep https://festivaljapon.com || echo "incorrect redirect for ${ENDPOINT}"
done
for ENDPOINT in ${ENDPOINTS}; do
    curl -sI ${BASE}${ENDPOINT} | grep "403 Forbidden" || echo "incorrect response for ${ENDPOINT}"
done
