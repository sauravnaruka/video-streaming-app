FRONTEND_DIR=frontend
BACKEND_DIR=backend

.PHONY: dev frontend backend build clean install test test-frontend test-backend setup format format-frontend format-backend

dev:
	$(MAKE) -j2 frontend backend

frontend:
	cd $(FRONTEND_DIR) && npm run dev

backend:
	cd $(BACKEND_DIR) && ./mvnw spring-boot:run

install:
	cd $(FRONTEND_DIR) && npm install

build:
	cd $(BACKEND_DIR) && ./mvnw package -DskipTests
	cd $(FRONTEND_DIR) && npm run build

clean:
	cd $(BACKEND_DIR) && ./mvnw clean
	cd $(FRONTEND_DIR) && rm -rf dist node_modules

test: test-frontend test-backend

test-frontend:
	cd $(FRONTEND_DIR) && npm test -- --run

test-backend:
	cd $(BACKEND_DIR) && ./mvnw test

setup:
	git config core.hooksPath .githooks

format: format-frontend format-backend

format-frontend:
	cd $(FRONTEND_DIR) && npx prettier --write .

format-backend:
	cd $(BACKEND_DIR) && ./mvnw spotless:apply
