# mengunduh atau mengambil base image node dari docker hub dengan tag 14-alpine
FROM node:14-alpine
# membuat directory baru bernama app dan menjadikannya sebagai working directory
WORKDIR /app
# menyalin semua berkas local working directory ke container working directory
COPY . .
# menentukan node environtment dalam production mode dan menggunakan container item-db sebagai database host
ENV NODE_ENV=production DB_HOST=item-db
# menginstal dependencies untuk production serta build aplikasi
RUN npm install --production --unsafe-perm && npm run build
# mengekspos atau membuka port pada container
EXPOSE 8080
#  menjalankan server dengan mengeksekusi perintah npm start
CMD ["npm", "start"]
# menambahkan metadata ke image agar terkoneksi dengan repository
LABEL org.opencontainers.image.source=https://github.com/fbpr/a433-microservices