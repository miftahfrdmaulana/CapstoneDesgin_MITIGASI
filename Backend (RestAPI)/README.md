# MITIGASi Backend (REST API)

**Mitigasi Akademik Terintegrasi** - Backend Service

Sistem informasi akademik terintegrasi untuk mitigasi dan monitoring progress akademik mahasiswa. Dikembangkan sebagai proyek tugas akhir S1 Teknik Komputer Universitas Telkom.

## Tech Stack

- **Framework**: Express.js
- **Database**: MySQL
- **Runtime**: Node.js
- **Cloud Storage**: Google Cloud Storage
- **Container**: Docker
- **Deployment**: Google Cloud Run

## Prerequisites

- Node.js (v14 atau lebih baru)
- MySQL Database
- NPM atau Yarn

## Installation

1. Clone repository
```bash
git clone https://github.com/miftahfrdmaulana/CapstoneDesgin_MITIGASI.git
cd "Backend (RestAPI)/backendCode"
```

2. Install dependencies
```bash
npm install
```

3. Setup environment variables
```bash
cp .env.development .env
```

4. Configure environment variables:
```env
NODE_ENV=development
DB_HOST=your_database_host
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_NAME=your_database_name
CORS_ORIGIN=your_frontend_url
```

5. Run the application
```bash
# Development
npm run dev

# Production
npm start
```

## Environment Configuration

| Variable | Description | Example |
|----------|-------------|---------|
| `NODE_ENV` | Environment mode | `development` / `production` |
| `DB_HOST` | Database host | `localhost` |
| `DB_USER` | Database username | `root` |
| `DB_PASSWORD` | Database password | `password123` |
| `DB_NAME` | Database name | `mitigasi_db` |
| `CORS_ORIGIN` | Frontend URL for CORS | `http://localhost:3000` |

## API Endpoints

### System
- `GET /` - Root endpoint (API info)
- `GET /health` - Health check endpoint
- `GET /api-docs` - Swagger API documentation

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `POST /api/auth/refresh` - Refresh token

### Admin Routes
- `GET /api/admin/*` - Admin management endpoints
- `POST /api/admin/*` - Admin creation endpoints
- `PUT /api/admin/*` - Admin update endpoints
- `DELETE /api/admin/*` - Admin deletion endpoints

### Faculty (Dosen Wali) Routes
- `GET /api/faculty/*` - Faculty data endpoints
- `POST /api/faculty/*` - Faculty management endpoints

### Student Routes
- `GET /api/student/*` - Student data endpoints
- `POST /api/student/*` - Student management endpoints

## Project Structure

```
backendCode/
├── config/           # Database & app configuration
├── controllers/      # Request handlers
├── middlewares/      # Authentication & validation
├── models/          # Database queries & models
├── routes/          # API route definitions
├── service/         # Business logic services
├── utils/           # Helper functions & utilities
├── ml_models/       # Machine learning models
└── server.js        # Application entry point
```

## Key Features

- **Authentication & Authorization**: JWT-based authentication with token blacklist
- **Role-based Access**: Admin, Faculty (Dosen Wali), Student roles
- **Academic Management**: Course, grade, and curriculum management
- **Student Monitoring**: Academic progress tracking
- **File Upload**: CSV upload with validation (10MB limit)
- **Cloud Storage**: Google Cloud Storage integration
- **API Documentation**: Swagger/OpenAPI documentation
- **Logging**: Comprehensive activity logging with Morgan
- **Health Monitoring**: Health check endpoint for Cloud Run
- **Graceful Shutdown**: Proper SIGTERM/SIGINT handling

## Development

```bash
# Development mode with hot reload
npm run dev

# Production mode
npm start

# Health check
curl http://localhost:5000/health  # Development
curl http://localhost:8080/health  # Production
```

## Deployment

The application is containerized using Docker and deployed on Google Cloud Run.

**Development**: `http://localhost:5000`
**Production**: `https://your-cloud-run-url` (Port 8080)

### Environment-specific Ports
- **Development**: Default PORT 5000
- **Production**: Uses `process.env.PORT` or defaults to 8080 (Cloud Run standard)

## Docker

```bash
# Build image
docker build -t mitigasi-backend .

# Run container
docker run -p 8080:8080 mitigasi-backend

# For development
docker run -p 5000:5000 -e NODE_ENV=development mitigasi-backend
```

## Database Schema

The application uses MySQL database with tables for:
- Users (Admin, Faculty, Students)
- Academic data (Courses, Grades, Curriculum)
- Monitoring data (Progress, Reports)
- System logs

## Contributing

Proyek tugas akhir S1 Teknik Komputer - Universitas Telkom

## License

Private academic project
