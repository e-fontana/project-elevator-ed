import csv, os, platform, time;

class Accuracy():
	def __init__(self):
		self.output_path = 'output.txt'
		self.generate_data()

	def clear(self):
		os.system("cls" if platform.system() == "Windows" else "clear")

	def generate_data(self):
		self.data = []
		finish = "$finish" in open(self.output_path).readlines()[-1]
		with open(self.output_path, "r", encoding='utf-8') as file:
			reader = csv.reader(file, delimiter=",")
			reader = list(reader)[0:-1] if finish else reader
			for row in reader:
				print(row)
				data_line = {}
				data_line["led1"] = int(row[0][-1])
				data_line["led2"] = int(row[1][-1])
				data_line["led3"] = int(row[2][-1])
				data_line["floor1"] = int(row[3][-1])
				data_line["floor2"] = int(row[4][-1])
				data_line["floor3"] = int(row[5][-1])
				data_line["door"] = int(row[6][-1])
				data_line["sos_mode"] = int(row[7][-1])
				data_line["weight_limit_exceeded"] = int(row[8][-1])
				self.data.append(data_line)
	
	def render(self):
		for i, line in enumerate(self.data):
			self.clear()
			floor1 = "➊" if line["floor1"] else "➀"
			floor2 = "➋" if line["floor2"] else "➁"
			floor3 = "➌" if line["floor3"] else "➂"

			led1 = "1●" if line["led1"] else "1○"
			led2 = "2●" if line["led2"] else "2○"
			led3 = "3●" if line["led3"] else "3○"
			door = "porta aberta" if line["door"] else "porta fechada"

			sos_mode = "SOS●" if line["sos_mode"] else "SOS○"
			weight_limit_exceeded = "weight●" if line["weight_limit_exceeded"] else "weight○"
			print(f'time: {i}')
			print(floor1, floor2, floor3, sep="  ")
			print(led1, led2, led3)
			print(sos_mode, weight_limit_exceeded)
			print(door)
			time.sleep(.2)

Accuracy().render()