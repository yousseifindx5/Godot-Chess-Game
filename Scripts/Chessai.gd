extends Node

const PIECE_VALUES = {
	1: 100,
	2: 320,
	3: 330,
	4: 500,
	5: 900,
	6: 20000
}

func get_best_move(board: Array, difficulty: String, chess_node) -> Dictionary:
	match difficulty:
		"easy":
			return get_random_move(board, chess_node)
		"medium":
			return minimax_root(board, 2, chess_node)
		"hard":
			return minimax_root(board, 3, chess_node)
	return {}

func get_random_move(board: Array, chess_node) -> Dictionary:
	var all_moves = get_all_black_moves(board, chess_node)
	if all_moves.is_empty(): return {}
	return all_moves[randi() % all_moves.size()]

func minimax_root(board: Array, depth: int, chess_node) -> Dictionary:
	var all_moves = get_all_black_moves(board, chess_node)
	var best_move = {}
	var best_score = -99999

	for move in all_moves:
		var moving_piece = board[move.from.x][move.from.y]
		var captured_piece = board[move.to.x][move.to.y]
		board[move.to.x][move.to.y] = moving_piece
		board[move.from.x][move.from.y] = 0

		var score = minimax(board, depth - 1, -99999, 99999, true, chess_node)

		board[move.from.x][move.from.y] = moving_piece
		board[move.to.x][move.to.y] = captured_piece

		if score > best_score:
			best_score = score
			best_move = move

	return best_move

func minimax(board: Array, depth: int, alpha: float, beta: float, is_maximizing: bool, chess_node) -> float:
	if depth == 0:
		return evaluate_board(board)

	if is_maximizing:
		var max_score = -99999.0
		var moves = get_all_black_moves(board, chess_node)
		for move in moves:
			var moving_piece = board[move.from.x][move.from.y]
			var captured_piece = board[move.to.x][move.to.y]
			board[move.to.x][move.to.y] = moving_piece
			board[move.from.x][move.from.y] = 0

			var score = minimax(board, depth - 1, alpha, beta, false, chess_node)

			board[move.from.x][move.from.y] = moving_piece
			board[move.to.x][move.to.y] = captured_piece

			max_score = max(max_score, score)
			alpha = max(alpha, score)
			if beta <= alpha: break
		return max_score
	else:
		var min_score = 99999.0
		var moves = get_all_white_moves(board, chess_node)
		for move in moves:
			var moving_piece = board[move.from.x][move.from.y]
			var captured_piece = board[move.to.x][move.to.y]
			board[move.to.x][move.to.y] = moving_piece
			board[move.from.x][move.from.y] = 0

			var score = minimax(board, depth - 1, alpha, beta, true, chess_node)

			board[move.from.x][move.from.y] = moving_piece
			board[move.to.x][move.to.y] = captured_piece

			min_score = min(min_score, score)
			beta = min(beta, score)
			if beta <= alpha: break
		return min_score

func evaluate_board(board: Array) -> float:
	var score = 0.0
	for i in 8:
		for j in 8:
			var piece = board[i][j]
			if piece < 0:
				score += PIECE_VALUES.get(abs(piece), 0)
			elif piece > 0:
				score -= PIECE_VALUES.get(piece, 0)
	return score

func get_all_black_moves(board: Array, chess_node) -> Array:
	var moves = []
	var old_white = chess_node.white
	chess_node.white = false
	for i in 8:
		for j in 8:
			if board[i][j] < 0:
				var piece_moves = chess_node.get_moves(Vector2(i, j))
				for m in piece_moves:
					moves.append({"from": Vector2(i, j), "to": m})
	chess_node.white = old_white
	return moves

func get_all_white_moves(board: Array, chess_node) -> Array:
	var moves = []
	var old_white = chess_node.white
	chess_node.white = true
	for i in 8:
		for j in 8:
			if board[i][j] > 0:
				var piece_moves = chess_node.get_moves(Vector2(i, j))
				for m in piece_moves:
					moves.append({"from": Vector2(i, j), "to": m})
	chess_node.white = old_white
	return moves
