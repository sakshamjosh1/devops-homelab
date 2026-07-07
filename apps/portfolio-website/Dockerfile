# Use official nginx base image
FROM nginx:alpine

# Copy static files to nginx html directory
COPY ./index.html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run nginx in foreground so container stays alive
CMD ["nginx", "-g", "daemon off;"]
