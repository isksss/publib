.PHONY: delete
delete:
	@echo "Deleting all resources..."
	@git clean -Xdf
	@echo "Done."