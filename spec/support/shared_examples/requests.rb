# frozen_string_literal: true

shared_examples "status: 200" do
  it "responds with 200 and proper body" do
    subject
    expect(response).to have_http_status(:ok)
    expect(response.body).to eq(response_body.to_json)
  end
end

shared_examples "status: 401" do |message = "You are not authorized to perform this action."|
  it "responds with 401 and proper body" do
    subject
    expect(response).to have_http_status(:unauthorized)
    expect(JSON.parse(response.body)["errors"][0]["title"]).to eq(message)
  end
end
