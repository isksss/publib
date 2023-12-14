.PHONY: delete
delete:
	@echo "Deleting all resources..."
	@git clean -n -d -f
	@echo "Done."