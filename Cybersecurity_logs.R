incident_id <- 1:10

incident_type <- c(
  "Phishing", "Malware", "Unauthorized Access",
  "Phishing", "DDoS", "Malware",
  "Data Breach", "Phishing", "DDoS",
  "Unauthorized Access"
)

severity <- c(
  "High", "Medium", "High", "Low", "High",
  "Medium", "Critical", "Low", "Medium", "High"
)

response_time <- c(30, 45, 25, 60, 20, 40, 15, 55, 35, 28)

status <- c(
  "Resolved", "Resolved", "In Progress", "Resolved",
  "Resolved", "In Progress", "Resolved", "Resolved",
  "In Progress", "Resolved"
)

incidents <- data.frame(
  incident_id, incident_type, severity,
  response_time, status
)

write.csv(incidents, "cybersecurity_logs.csv",
          row.names = FALSE)

data <- read.csv("cybersecurity_logs.csv")

print(data)

cat("Total Incidents:", nrow(data), "\n")

cat("Incident Types:\n")
print(table(data$incident_type))

cat("Severity Distribution:\n")
print(table(data$severity))

cat("Incident Status:\n")
print(table(data$status))

cat("Average Response Time:",
    mean(data$response_time), "minutes\n")

barplot(
  table(data$incident_type),
  main = "Cybersecurity Incidents by Type",
  xlab = "Incident Type",
  ylab = "Number of Incidents",
  col = "skyblue",
  las = 2
)

pie(
  table(data$severity),
  main = "Incident Severity Distribution"
)

hist(
  data$response_time,
  main = "Incident Response Time Distribution",
  xlab = "Response Time (Minutes)",
  col = "lightgreen"
)

barplot(
  table(data$status),
  main = "Incident Status Distribution",
  xlab = "Status",
  ylab = "Number of Incidents",
  col = "orange"
)