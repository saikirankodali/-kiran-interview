# Stage 1: Create index.html
FROM alpine AS builder
RUN echo "<p>Hello World</p>" > /opt/index.html

# Stage 2: Final image with Nginx
FROM nginx
COPY --from=builder /opt/index.html /usr/share/nginx/html/index.html
RUN echo "starting nginx"
CMD ["nginx", "-g", "daemon off;"]
