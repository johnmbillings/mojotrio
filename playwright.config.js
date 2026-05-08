module.exports = {
  testDir: './tests',
  timeout: 15000,
  use: {
    headless: true,
    viewport: { width: 1200, height: 800 },
  },
  projects: [
    { name: 'chromium', use: { browserName: 'chromium' } },
  ],
};
