pub_get: 
	echo "root directory"; \
	flutter pub get; \
	cd example; \
	echo "example directory"; \
	flutter pub get

pod_install:
	echo "running pod install"; \
	cd example/ios; \
	pod install; \
	echo "done";