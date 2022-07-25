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

pub_clean:
	echo "running pub clean"; \
	cd example/; \
	flutter clean; \
	echo "done";