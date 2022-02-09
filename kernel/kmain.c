void dummy_test_entrypoint()
{
}

void kmain(void) {
	char *video_memory = 0xb8000;
	*video_memory = 'X';
}
